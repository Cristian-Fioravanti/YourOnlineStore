package it.yourstore.store.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import it.yourstore.store.controller.UserController;
import it.yourstore.store.dto.ViewUserDto;
import it.yourstore.store.domain.User;
import it.yourstore.store.mapper.UserMappers;

import it.yourstore.store.controller.OrderController;

@RequiredArgsConstructor
@Component
public class UserModelAssembler extends BaseModelAssembler<User, ViewUserDto> {
	private final UserMappers userMappers;

	@Override
	public ViewUserDto toModel(User user) {
		ViewUserDto userDto = userMappers.map(user);
		// SELF LINK
		Link selfLink = convert(linkTo(methodOn(UserController.class).read(user.getObjectKey())).withSelfRel());
		userDto.add(selfLink);
		// PARENT LINKS
		// CHILDREN LINKS
		if (user.getTheOrder() != null) {
			Link orderLink = convert(
					linkTo(methodOn(OrderController.class).findByUser(user.getObjectKey(), null)).withRel("theOrder"));
			userDto.add(orderLink);
		}
		return userDto;
	}
	// @Override
	// public CollectionModel<UserDto> toCollectionModel(Iterable<? extends User>
	// entities) {
	// CollectionModel<UserDto> collectionEntities =
	// super.toCollectionModel(entities);
	// collectionEntities.add(linkTo(methodOn(OrdineController.class).findPaginated(null,
	// null)).withSelfRel());
	// return collectionEntities;
	// }
}

