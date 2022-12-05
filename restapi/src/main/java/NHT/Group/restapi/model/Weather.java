package NHT.Group.restapi.model;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@ToString
@Getter
@Setter
@Entity
@Table(name = "fact_weather")
public class Weather {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "id_province", referencedColumnName = "id_province")
    private Province province;

    @ManyToOne()
    @JoinColumn(name = "id_time", referencedColumnName = "id")
    private Time weather_time;

    @ManyToOne()
    @JoinColumn(name="id_date", referencedColumnName = "id")
    private DateDim date_weather;

    @Column(name = "id_staging_fact")
    private Integer id_staging_fact;

    @Column(name="temperature")
    private Integer temperature;

    @Column(name="description")
    private String description;

    @Column(name="humidity")
    private Integer humidity;

    @Column(name="vision")
    private Integer vision;

    @Column(name="wind")
    private Float wind;

    @Column(name="uv_index")
    private Float uv_index;

    @Column(name="air_quality")
    private String air_quality;

   @Column(name="expired_date")
    private Integer expired_date;

    @Column(name="expired_time")
    private Integer expired_time;
}
