package NHT.Group.restapi.dto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.Date;
@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class DateDto {
    private Long id;
    private Date full_date;
    private Integer day_since_2005;
    private Integer month_since_2005;
    private String day_of_week;
    private String calendar_month;
    private Integer calendar_year;
    private String calendar_year_month;
    private Integer day_of_month;
    private Integer day_of_year;
    private Integer week_of_year_sunday;
    private String year_week_sunday;
    private Date week_sunday_start;
    private Integer week_of_year_monday;
    private String year_week_monday;
    private Date week_monday_start;
    private String holiday;
    private String day_type;
}
