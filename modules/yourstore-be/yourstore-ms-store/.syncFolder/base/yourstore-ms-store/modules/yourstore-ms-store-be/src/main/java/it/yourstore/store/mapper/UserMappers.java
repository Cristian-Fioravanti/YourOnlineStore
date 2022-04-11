package it.yourstore.store.mapper;

import it.yourstore.store.dto.NewUserDto;
import it.yourstore.store.dto.EditUserDto;
import it.yourstore.store.dto.ViewUserDto;
import it.yourstore.store.domain.User;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import java.util.Optional;

@Mapper
public interface UserMappers {

	User map(NewUserDto userDto);

	User map(EditUserDto userDto);

	ViewUserDto map(User user);

	default Page<ViewUserDto> map(Page<User> page) {
		return page.map(this::map);
	}

	default Optional<ViewUserDto> map(Optional<User> read) {
		return read.map(this::map);
	}
}
