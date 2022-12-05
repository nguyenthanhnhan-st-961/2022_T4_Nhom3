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
@Table(name = "dim_time")
public class Time {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name="hour_time")
    private String hour_time;

    @Column(name="hour")
    private Integer hour;
    @Column(name="minute")
    private Integer minute;

    @OneToMany(mappedBy = "weather_time")
    Set<Weather> times;
}
