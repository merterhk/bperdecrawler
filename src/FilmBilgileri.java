
/**
 *
 * @author Merter
 * Yeni metod (veri çekme işlemi) eklendiğinde tumunuCek() metodu güncellenmelidir.
 * tumunuCek() metodu dışındaki metodlar sadece değeri geri döndürür.tumunuCek() metodu değişkenleri günceller.
 *
 */
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FilmBilgileri {

    MashIt mit = new MashIt();
    Vt vt = new Vt();
    String source;
    String filmId;
    boolean grabbed = false;
    String filmIsmi, vizyonTarihi, yonetmen, orjinalAdi, ulke, tur, yapimYili, ozet;
    ArrayList<String> oyuncular;

    public void grabSource(String filmId) {
        try {
            this.filmId = filmId;
            source = mit.mashIt("http://www.beyazperde.com/filmler/film-" + filmId + "/");
            grabbed = true;
        } catch (Exception e) {
            filmId = "";
            grabbed = false;
        }
    }

    public String filmIsmi() {
        String temp;
        Pattern p = Pattern.compile("(<h1 property=\"v:name\">)(.*?)(</h1>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(2);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public String vizyonTarihi() {
        String temp;// = source.substring(source.indexOf("Vizyon tarihi:")+1);
        Pattern p = Pattern.compile("(Vizyon tarihi: <span class=\"bold\"><span class=\"acLnk [\\w\\s]*\">)(.*\\d{4})(</span></span>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(2);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public String yonetmen() {
        String temp = "";
        Pattern p = Pattern.compile("(<a rel=\"v:directedBy\" title=\"[\\w\\s]*\" href=\"/sanatcilar/sanatci-[\\w]*/\" class=\"underline\" >)(.*?)(</a>)");
        Matcher m = p.matcher(source);
        while (m.find()) {
            temp += m.group(2) + ",";
        }

        return temp;
    }

    public String orjinalAdi() {
        String temp;
        Pattern p = Pattern.compile("(Orijinal adı: <span class=\"purehtml\"><em>)(.*)(</em></span>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(2);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public String ulke() {
        String temp;
        Pattern p = Pattern.compile("(\\w*)(</span><span>\\. </span>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(1);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public String tur() {
        String temp = "";
        Pattern p = Pattern.compile("(<a class=\"underline\" href=\"/filmler/tum-filmleri/kullanici-puani/tur-[\\w]*/\">)(\\w*)(</a>)");
        Matcher m = p.matcher(source);
        boolean virgul = false;
        while (m.find()) {
            temp += ((virgul) ? "," : "") + m.group(2);
            virgul = true;
        }

        return temp;
    }

    public String yapimYili() {
        String temp;
        Pattern p = Pattern.compile("(Yapım yılı:.*\">)(\\d{4})(</span>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(2);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public String ozet() {
        String temp;
        Pattern p = Pattern.compile("(<span class=\"bold\">Özet: </span><span property=\"v:summary\">)(.*?)(</span></p>)");
        Matcher m = p.matcher(source);
        if (m.find()) {
            temp = m.group(2);
        } else {
            temp = "-bulunamadı-";
        }
        return temp;
    }

    public ArrayList<String> oyuncular() {
        ArrayList<String> ali = new ArrayList<String>();
        String kaynak = mit.mashIt("http://www.beyazperde.com/filmler/film-" + filmId + "/oyuncular/");

        String temp = "";
        Pattern p = Pattern.compile("(<div class=\"titlebar\"><h3><a href=\"/sanatcilar/sanatci-[\\w]*?/\">)([\\w\\s\\f ]*?)(</a></h3></div><p>Rol:)");
        Matcher m = p.matcher(kaynak);
        while (m.find()) {
            String oyuncu = m.group(2);
//            System.out.println("-" + oyuncu + "-");
            ali.add(oyuncu);
        }
        return ali;
    }

    public void tumunuCek() {
        if (grabbed) {
            filmIsmi = filmIsmi();
            vizyonTarihi = vizyonTarihi();
            yonetmen = yonetmen();
            orjinalAdi = orjinalAdi();
            ulke = ulke();
            tur = tur();
            yapimYili = yapimYili();
            ozet = ozet();
            oyuncular = oyuncular();
        }
    }

    public void tumunuCek(String filmId) {
        grabSource(filmId);
        filmIsmi = filmIsmi();
        vizyonTarihi = vizyonTarihi();
        yonetmen = yonetmen();
        orjinalAdi = orjinalAdi();
        ulke = ulke();
        tur = tur();
        yapimYili = yapimYili();
        ozet = ozet();
        oyuncular = oyuncular();
    }

    public boolean kaydet() {
        try {
            if (grabbed) {
                /*
                | cinema_artists         |+
                | cinema_cast            |?-
                | cinema_directors       |+
                | cinema_genres          |?-
                | cinema_movieCast       |?-
                | cinema_movieDirectors  |+
                | cinema_movieScenarists |?-
                | cinema_movieYears      |+
                | cinema_movies          |+
                | cinema_properties      |+
                | cinema_scenarists      |?-
                | cinema_years           |+
                 */
                int fid = vt.executeAndGetLastID("insert ignore into cinema_movies (title,href,status) values ('" + filmIsmi + "','" + filmId + "',1)");

                /* Bilgiler ekleniyor.. */
                int yonetmenId = vt.executeAndGetLastID("insert ignore into cinema_directors (name) values ('" + yonetmen + "')");
                for (String oyuncu : oyuncular) {
                    vt.execute("insert ignore into cinema_artists (name) values ('" + oyuncu + "')");
                }
                vt.execute("insert ignore into cinema_genres (name) values ('" + tur + "')");
                vt.execute("insert ignore into cinema_years (year) values (" + yapimYili + ")");
                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'tur','" + tur + "')");
                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'yapimYili','" + yapimYili + "')");
//                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'ozet','" + ozet + "')");
                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'ulke','" + ulke + "')");
                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'orjinalAdi','" + orjinalAdi + "')");
                vt.execute("insert ignore into cinema_properties (movieId,name,value) values (" + fid + ",'vizyontarihi','" + vizyonTarihi + "')");

                /* Bağlantılar ekleniyor.. */
                vt.execute("insert ignore into cinema_movieDirectors (movieId,directorId) values ("+fid+"," + yonetmenId + ")");
                vt.execute("insert ignore into cinema_movieYears (movieId,year) values ("+fid+"," + yapimYili + ")");


            } else {
                System.out.println("Film bilgileri çekilmedi.");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Veritabanına eklerken hata oluştu : " + e.getLocalizedMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        FilmBilgileri bg = new FilmBilgileri();
        System.out.println("Deneme film bilgileri.");
//        bg.grabSource("http://www.beyazperde.com/filmler/film-19776/");
        bg.tumunuCek("19776");
        bg.kaydet();
//        System.out.println(bg.filmIsmi());
//        System.out.println(bg.vizyonTarihi());
//        System.out.println(bg.yonetmen());
//        System.out.println(bg.orjinalAdi());
//        System.out.println(bg.ulke());
//        System.out.println(bg.tur());
//        System.out.println(bg.yapimYili());
//        System.out.println(bg.ozet());
//        bg.oyuncular();
    }
}
