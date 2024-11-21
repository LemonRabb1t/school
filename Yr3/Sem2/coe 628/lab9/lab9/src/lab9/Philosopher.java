package lab9;

/**
 * NOTE: This implementation of Philosopher utilizes the code provided in 
 * the module "lab9_lisi.edu-dining-Philosopherecture8" in the D2L.
 * @author Andrew Le
 */
public class Philosopher extends Thread{

    private enum PhilState {
        THINKING, HUNGRY, EATING
    }
    
    static final int N = 4; 
    private Semaphore mutex = new Semaphore(1);
    private Semaphore[] s = new Semaphore[N+1]; 
    private PhilState[] state = new PhilState[N+1];
    
    private static int completedDinners = 0;
    private int id;
    
    public Philosopher(int id) {
        this.id = id;
        synchronized (Philosopher.class) {
            if (s[1] == null) { // This is used to intiialize 1-based indexing to match the sample output.
                for (int i = 1; i <= N; i++) {
                    s[i] = new Semaphore(0);
                    state[i] = PhilState.THINKING;
                }
            }
        }
    }
    
    private int right(int i) {
        return (i % N) + 1;
    }
    
    private int left(int i) {
        return (i == 1) ? N : i - 1;
    }
    
    private void test(int i) {
        if (state[i] == PhilState.HUNGRY &&
            state[left(i)] != PhilState.EATING &&
            state[right(i)] != PhilState.EATING) {
            state[i] = PhilState.EATING;
            s[i].up(); // Notify the philosopher can start eating
        }
    }

    
    public void getForks(int i) {
        state[i] = PhilState.HUNGRY;
        
       // System.out.println("Philosopher " + i + " is hungry.");
        
        test(i); // Attempt to acquire forks
        mutex.down(); // Enter critical section
        if (state[i] != PhilState.EATING) {
            
            System.out.println("Philosopher " + i + " is waiting for forks.");
            
            s[i].down(); // Block if not able to eat
        }else{
            System.out.println("Fork " + left(i) + " taken by Philosopher " + i);
            System.out.println("Fork " + right(i) + " taken by Philosopher " + i);
        }
        mutex.up(); // Exit critical section
    }
    
    public void putForks(int i) {
        mutex.down(); // Enter critical section
        state[i] = PhilState.THINKING;
        
        System.out.println("Philosopher " + i + " completed his dinner");
        System.out.println("Philosopher " + i + " released fork " + left(i) + " and fork " + right(i));
        
        // Test left and right neighbors
        test(left(i));
        test(right(i));
        incrementCompletedDinners();
        mutex.up(); // Exit critical section
    }
    
    private synchronized static void incrementCompletedDinners(){
        completedDinners++;
        System.out.println("Till now number of philosophers completed dinner are " + completedDinners);
        if (completedDinners == N) {
            System.out.println("All philosophers have finished their dinner.");
            System.exit(0); // Finished, end program here
        }
    }

    
    public void think(){
        try{
            Thread.sleep((long) Math.round(Math.random()*4500));
        }catch(InterruptedException e){}
    }
    
    public void eat(){
        try{
            Thread.sleep((long) Math.round(Math.random()*4500));
        }catch(InterruptedException e){}
    }
   
    
    
    public void run() { 
        while (true) {
            think();
            getForks(this.id);
            eat();
            putForks(this.id);
        }
    }
    
    
    public static void main(String[] args) {
        Philosopher ptable[] = new Philosopher[N+1];
        for (int i = 1; i <= N; i++) { 
            ptable[i] = new Philosopher(i);
            
        }
        for (int i = 1; i <= N; i++) { 
            ptable[i].start();
        }
        
    }
}