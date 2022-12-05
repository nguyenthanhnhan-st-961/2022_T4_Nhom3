package NHT.Group.restapi.mapper;

import NHT.Group.restapi.dto.ProvinceDto;
import NHT.Group.restapi.model.Province;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component("provinceMapper")
public class ProvinceMapper implements IMapper<Province, ProvinceDto>{

    @Override
    public Province toEntity(ProvinceDto dto) {
        if(dto == null) return null;
        return Province.builder()
                .id(dto.getId_province())
                .name(dto.getName())
                .build();
    }

    @Override
    public ProvinceDto toDto(Province entity) {
        if(entity == null) return null;
        return ProvinceDto.builder()
                .id_province((long) entity.getId_province())
                .name(entity.getName())
                .build();
    }

    @Override
    public List<Province> toEntities(List<ProvinceDto> provinceDtos) {
        List<Province> provinces = new ArrayList<>();
        for (ProvinceDto provinceDto : provinceDtos) {
            provinces.add(toEntity(provinceDto));
        }
        return provinces;
    }

    @Override
    public List<ProvinceDto> toDtos(List<Province> entities) {
    List<ProvinceDto> provinceDtos = new ArrayList<>();
        for (Province province : entities) {
            provinceDtos.add(toDto(province));
        }
        return provinceDtos;
    }
}

