package NHT.Group.restapi.model;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Set;


@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@ToString
@Getter
@Setter
@Entity
@Table(name = "dim_date")
public class DateDim {
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name = "id", nullable = false)
        private Long id;

        @Column(name = "full_date")
        private java.util.Date full_date;

        @Column(name = "day_since_2005")
        private Integer day_since_2005;

        @Column(name = "month_since_2005")
        private Integer month_since_2005;

        @Column(name = "day_of_week")
        private String day_of_week;

        @Column(name = "calendar_month")
        private String calendar_month;

        @Column(name = "calendar_year")
        private Integer calendar_year;

        @Column(name = "calendar_year_month")
        private String calendar_year_month;

        @Column(name = "day_of_month")
        private Integer day_of_month;

        @Column(name = "day_of_year")
        private Integer day_of_year;

        @Column(name = "week_of_year_sunday")
        private Integer week_of_year_sunday;

        @Column(name = "year_week_sunday")
        private String year_week_sunday;

        @Column(name = "week_sunday_start")
        private java.util.Date week_sunday_start;

        @Column(name = "week_of_year_monday")
        private Integer week_of_year_monday;

        @Column(name = "year_week_monday")
        private String year_week_monday;

        @Column(name = "week_monday_start")
        private java.util.Date week_monday_start;

        @Column(name = "holiday")
        private String holiday;

        @Column(name="day_type")
        private String day_type;

        @OneToMany(mappedBy = "date_weather")
        Set<Weather> dates;

}
