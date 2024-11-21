<%-- 
    Document   : register
    Created on : Feb 18, 2024, 11:31:09 a.m.
    Author     : sarahjawwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Account | SINIS Convenience</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Custom CSS */
        /* Custom CSS */
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("resources/register.png");
            background-size: contain; /* Adjust the background size */
            background-position: center;
        }

        .custom-form {
            padding: 20px;
            border-radius: 20px;
            background-color: #fbdada;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 0 10px; /* Adjust margins for spacing */
            max-width: 550px; /* width of box */
        }

        /* Form styles */
        .custom-form .form-group {
                width: 100%;
                max-width: 900px; /* Adjust the maximum width as needed */
                margin: 30px; /* Adjust top margin as needed and set auto margins for centering */
            }


        th, td {
            text-align: center;
            font-family: Noteworthy; /* Change the font family here */
            font-weight: bold; /* Add this line to make the text bold */
        }

        .page-top {
            font-family: 'Noteworthy';
            align-items: center;
            text-align: center;
        }

        .button-circ{
            display: flex;
            justify-content: flex-end; /* Align items to the end of the container (to the right in this case) */
            margin-top: 450px; /* Adjust the margin as needed */
        }
        
        .button-box {
            display: flex;
            justify-content: center;
            margin-top: 0px; /* Add margin to separate from other elements */
        }

        .button-box input[type="submit"],
        .button-box input[type="reset"] {
            margin: 5px; /* Adjust margin to add space between buttons */
        }

        </style>
    </head>
    <body>

        <!-- Header -->
        <div class="button-circ">
            <a href="/lab2/index.html" target="_self" class="btn btn-secondary">Return to log in</a>
        </div>

        <!-- form -->

        <div class="custom-form container mt-5" >
<!-- form action should go to java serverlette url, ex custRegister-->
            <form action="custRegister" method="POST"novalidate>

                <table style="width:100%">
                    <tr>
                        <td> 	<label for="fname" >First Name:</label></td>
                        <td>  <input type="text" id="fname" name="fname" placeholder="John" required></td>
                    </tr>
                    <tr>
                        <td> 	<label for="lname" >Last Name:</label></td>
                        <td>  <input type="text" id="lname" name="lname" placeholder="Doe" required></td>
                    </tr>
                    <tr>
                        <td> 	<label for="addressL1" >Address:</label></td>
                        <td>  <input type="text" id="addressL1" name="addressL1" placeholder="Street number and name" required></td>
                    </tr>
                    <tr>
                        <td> 	<label for="addressL2" ></label></td>
                        <td>  <input type="text" id="addressL2" name="addressL2" placeholder="Unit(if applicable)"></td>
                    </tr>  
                    <tr>
                        <td> <label for="city" </td>
                        <td>  <input type="text" id="city" name="city" placeholder="City" required></td>
                    </tr> 
                    <tr>
                        <td> 	<label for="province" >Province/State:</label></td>
                        <td> 	<select id="province" name="province" required>
                                <option value="AB">Alberta</option>
                                <option value="BC">British Columbia</option>
                                <option value="MN">Manitoba</option>
                                <option value="NB">New Brunswick</option>
                                <option value="NF">Newfoundland</option>
                                <option value="NW">Northwest Territories</option>
                                <option value="NS">Nova Scotia</option>
                                <option value="NU">Nunavut</option>
                                <option value="ON">Ontario</option>
                                <option value="PE">Prince Edward Island</option>
                                <option value="QC">Quebec</option>
                                <option value="SK">Saskatchewan</option>
                                <option value="YU">Yukon</option>
                                <option value="null"></option>
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="AR">Arkansas</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="CT">Connecticut</option>
                                <option value="DE">Delaware</option>
                                <option value="DC">District Of Columbia</option>
                                <option value="FL">Florida</option>
                                <option value="GA">Georgia</option>
                                <option value="HI">Hawaii</option>
                                <option value="ID">Idaho</option>
                                <option value="IL">Illinois</option>
                                <option value="IN">Indiana</option>
                                <option value="IA">Iowa</option>
                                <option value="KS">Kansas</option>
                                <option value="KY">Kentucky</option>
                                <option value="LA">Louisiana</option>
                                <option value="ME">Maine</option>
                                <option value="MD">Maryland</option>
                                <option value="MA">Massachusetts</option>
                                <option value="MI">Michigan</option>
                                <option value="MN">Minnesota</option>
                                <option value="MS">Mississippi</option>
                                <option value="MO">Missouri</option>
                                <option value="MT">Montana</option>
                                <option value="NE">Nebraska</option>
                                <option value="NV">Nevada</option>
                                <option value="NH">New Hampshire</option>
                                <option value="NJ">New Jersey</option>
                                <option value="NM">New Mexico</option>
                                <option value="NY">New York</option>
                                <option value="NC">North Carolina</option>
                                <option value="ND">North Dakota</option>
                                <option value="OH">Ohio</option>
                                <option value="OK">Oklahoma</option>
                                <option value="OR">Oregon</option>
                                <option value="PA">Pennsylvania</option>
                                <option value="RI">Rhode Island</option>
                                <option value="SC">South Carolina</option>
                                <option value="SD">South Dakota</option>
                                <option value="TN">Tennessee</option>
                                <option value="TX">Texas</option>
                                <option value="UT">Utah</option>
                                <option value="VT">Vermont</option>
                                <option value="VA">Virginia</option>
                                <option value="WA">Washington</option>
                                <option value="WV">West Virginia</option>
                                <option value="WI">Wisconsin</option>
                                <option value="WY">Wyoming</option>
                            </select></td>
                    </tr> 

                    <tr>
                        <td> 	<label for="Country" >Country:</label></td>
                        <td> 	<select id="Country" name="Country" required>
                                <option value="CA">Canada</option>
                                <option value="US">United States of America</option>
                            </select></td>
                    </tr> 
                    <tr>
                        <td>  	<label for="email">Enter your email:</label></td>
                        <td>  	<input type="email" id="email" name="email" placeholder="Ex. johndoe@gmail.com" required></td>
                    </tr>
                    <tr>
                        <td>  	<label for="username">Create a username:</label></td>
                        <td>  	<input type="text" id="username" name="username" placeholder="Ex. johnD123" required></td>
                    </tr>
                    <tr>
                        <td>  	<label for="password">Create a password:</label></td>
                        <td>  	<input type="password" id="password" name="password" placeholder="Must be at least 8 characters" required></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>

                        <td colspan="2">  <input type="radio" id="terms" name="terms" value="1" required>
                            <label for="terms">I agree to the terms and conditions</label><br></td>
                    </tr>

                </table>

                <br>
                    <div class="button-box">
                        <input type="submit" value="Submit" class="btn btn-secondary">
                        <input type="reset" value="Reset" class="btn btn-secondary">
                    </div>
            </form> 
        </div>
    </body>
</html>
