package converts;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * @author 曾佳
 */
public class DateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf = getSimpleDate(source);
        Date date = new Date();
        try {
            date = sdf.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    private SimpleDateFormat getSimpleDate(String source) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        if (Pattern.matches("^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", source)) {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        } else if (Pattern.matches("^\\d{4}/\\d{2}/\\d{2} \\d{2}:\\d{2}:\\d{2}$", source)) {
            sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        } else if (Pattern.matches("^\\d{4}\\d{2}\\d{2} \\d{2}:\\d{2}:\\d{2}$", source)) {
            sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        }
        return sdf;
    }

}
