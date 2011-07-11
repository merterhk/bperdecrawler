
/**
 *
 * @author Merter
 */
import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BeyazOrumcek {

    public ArrayList<String> yillarArasiFilmler() {
        Scanner s = new Scanner(System.in);

        System.out.println("Yıl aralığı - Başlangıç (Dahil):");
        int y1 = s.nextInt();
        System.out.println("Yıl aralığı - Bitiş (Dahil):");
        int y2 = s.nextInt();
        return yillarArasiFilmler(y1, y2);
    }

    public ArrayList<String> yillarArasiFilmler(int y1, int y2) {
        ArrayList<String> ali = new ArrayList<String>();
        if (y1 > 1900 && y1 <= y2) {
            Pattern p;
            Matcher m;
            for (int y = y1; y <= y2; y++) {
                int onyil = (y / 10) * 10;
                int page = 1, sayfa = 0;
                do {
                    String url = "http://www.beyazperde.com/filmler/tum-filmleri/kullanici-puani/onyil-" + onyil + "/yila-" + y + "/?page=" + page + "";
                    String source = (new MashIt().mashIt(url));

                    /*<li><span class="acLnk 1F4446484E4843C11FCBC34E1E4446484E4843C1461F47C348484A494642461EC0C34A49461F4F49C646481E2A2626201FC646484A1E2A2626261F2FC04A4C432E23">5</span></li></ul>*/
                    /*Sayfaları listeler*/
                    String tempa = "";
                    p = Pattern.compile("(<li><span class=\".*?\">)(\\d+)(</span></li></ul>)");
                    m = p.matcher(source);
                    if (m.find()) {
                        sayfa = Integer.parseInt(m.group(2));
                    }

                    /*<h2 class="tt_18 d_inline"><a Class="no_underline" href="/filmler/film-118605/">Herşey Çok Güzel Olacak</a></h2>*/
                    /*Filmleri listeler*/
                    System.out.println(y + " yılı , " + page + ". sayfa.");
                    String temp = "";
                    p = Pattern.compile("(<h2 class=\"tt_18 d_inline\"><a Class=\"no_underline\" href=\"/filmler/film-)([\\w]*)(/\">)(.*?)(</a></h2>)");
                    m = p.matcher(source);
                    while (m.find()) {
                        String film = m.group(2);
                        ali.add(film);
                        FilmBilgileri fb = new FilmBilgileri();
                        fb.tumunuCek(film);
                        fb.kaydet();
                        System.out.println(film);
                    }

                    page++;
                } while (page <= sayfa);

            }
        } else {
            System.out.println("Geçersiz yıl aralığı..");
        }
        return ali;

    }

    public static void main(String[] args) {
        BeyazOrumcek bo = new BeyazOrumcek();
        if (args.length == 2) {
            int y1 = Integer.parseInt(args[0]);
            int y2 = Integer.parseInt(args[1]);
            if (y1 > 1900 && y2 < 3000) {
                bo.yillarArasiFilmler(y1, y2);
            }
        } else {
            bo.yillarArasiFilmler();
        }
    }

    public String tempGrab() {
        try {
            Scanner s = new Scanner(new File("temp.html"), "UTF-8");
            String source = "";
            while (s.hasNext()) {
                source += s.nextLine();
            }
            return source;
        } catch (Exception e) {
            System.out.println("Dosya okunamadı." + e.getLocalizedMessage());
            return "-dosya okunamadı-";
        }
    }
}
