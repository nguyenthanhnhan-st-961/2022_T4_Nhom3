package NHT.Group.restapi.model;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@SuperBuilder
@Entity
@Table(name = "dim_province")
public class Province {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name="id_province")
    private Long id_province;


    @Column(name="name")
    private String name;


    @Column(name="start_date")
    private Date started_date;


    @Column(name="start_time")
    private String started_time;


    @Column(name="expired_date")
    private Date expired_date;


    @Column(name="expired_time")
    private String expired_time;


    @OneToMany(mappedBy = "province")
    Set<Weather> provinces;

}
