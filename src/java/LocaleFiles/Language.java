package LocaleFiles;

import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.http.Cookie;

public enum Language {

    RU("RU", "RU"), EN("ENG", "ENG"), IT("IT", "IT");

    private String code;
    private static Language defaultLanguage = RU;

    public static Language getDefaultLanguage() {
        return defaultLanguage;
    }
    
    public static ArrayList<String> getAllLanguageCode() {
        ArrayList<String>  ret = new ArrayList<String>();
        ret.add(RU.code);
        ret.add(EN.code);
        ret.add(IT.code);
        return ret;
    }
    
    public static Language[] getAllLanguages() {
        Language[] lang = {RU, EN, IT};
        return lang;
    }
    
    public static Language getByCode(String code) {
        Language[] langs = {RU, EN, IT};
        for(Language l : langs){
            if(code.equals(l.code)) {
                return l;
            }
        }
        return getDefaultLanguage();
    }
    public Locale getLocale(){
        if(language.equals(EN.code)){return Locale.US;}
        else if(language.equals(IT.code)){return Locale.ITALY;}
        return null;
    }
    public ResourceBundle getLocaleFile(){
        if(language.equals(EN.code)){return new Text_en_US();}
        else if(language.equals(IT.code)){return new Text_it_IT();}
        return new Text_ru_RU();
    }
    public static void setDefaultLanguage(Language defaultLanguage) {
        Language.defaultLanguage = defaultLanguage;
    }
    private String language;

    private Language(String code, String language) {
        this.code = code;
        this.language = language;
    }

    public String getCode() {
        return code;
    }

    public String getLanguage() {
        return language;
    }

    public static String getLanguage(Cookie[] cookies) {
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("lang")) {
                    setDefaultLanguage(getByCode(cookie.getValue()));
                    return cookie.getValue();
                }
            }
        }
        return defaultLanguage.code;
    }
}
