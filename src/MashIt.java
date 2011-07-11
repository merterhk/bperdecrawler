
/**
 *
 * @author Merter
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

public class MashIt {

    public String mashIt(String requestUrl) {
        String source = "";
        try {
            URL url = new URL(requestUrl.toString());

            BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                source += inputLine;
            }
            in.close();

        } catch (Exception e) {
            System.out.println("Mash Error." + e.getLocalizedMessage());
        }
        return source;
    }

    public String mashIt(String requestUrl, String post) {
        String source = "";
        try {
            URL url = new URL(requestUrl.toString());

            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(post);
            wr.flush();

            BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                source += inputLine;
            }
            in.close();
        } catch (Exception e) {
            System.out.println("Mash Error." + e.getLocalizedMessage());
        }
        return source;
    }
}
