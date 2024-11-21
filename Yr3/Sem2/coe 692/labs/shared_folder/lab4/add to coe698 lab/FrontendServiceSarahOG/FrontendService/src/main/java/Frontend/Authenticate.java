package Frontend;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.*;
import java.security.Key;
import java.util.*;
import java.util.Map.Entry;

public class Authenticate {
    SignatureAlgorithm signatureAlgo;
    String secretString;
    Key signingKey;

    public Authenticate() {
        signatureAlgo = SignatureAlgorithm.HS256;
        signingKey = Keys.secretKeyFor(signatureAlgo);
    }

    public String createJWT(String issuer, String subject, long ttlMillis) {
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);

        JwtBuilder builder = Jwts.builder()
                .setIssuedAt(now)
                .setSubject(subject)
                .setIssuer(issuer)
                .signWith(signingKey);

        if (ttlMillis > 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }

        String token = builder.compact();
        System.out.println(token);
        return token;
    }

    public Entry<Boolean, String> verify(String jwt) {
        try {
            Jws<Claims> jws = Jwts.parserBuilder()
                    .setSigningKey(signingKey)
                    .build()
                    .parseClaimsJws(jwt);

            long nowMillis = System.currentTimeMillis();
            Date now = new Date(nowMillis);

            if (jws.getBody().getExpiration().before(now)) {
                return new AbstractMap.SimpleEntry<>(false, "");
            }

            String username = jws.getBody().getSubject();
            return new AbstractMap.SimpleEntry<>(true, username);
        } catch (JwtException e) {
            System.out.println("Cannot use JWT as intended");
            return new AbstractMap.SimpleEntry<>(false, "");
        }
    }
}