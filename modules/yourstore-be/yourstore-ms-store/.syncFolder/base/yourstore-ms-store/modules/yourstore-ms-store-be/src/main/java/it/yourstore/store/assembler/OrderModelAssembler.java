package it.yourstore.store.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import it.yourstore.store.controller.OrderController;
import it.yourstore.store.dto.ViewOrderDto;
import it.yourstore.store.domain.Order;
import it.yourstore.store.mapper.OrderMappers;

import it.yourstore.store.controller.UserController;

import it.yourstore.store.controller.OrderItemController;

@RequiredArgsConstructor
@Component
public class OrderModelAssembler extends BaseModelAssembler<Order, ViewOrderDto> {
	private final OrderMappers orderMappers;

	@Override
	public ViewOrderDto toModel(Order order) {
		ViewOrderDto orderDto = orderMappers.map(order);
		// SELF LINK
		Link selfLink = convert(linkTo(methodOn(OrderController.class).read(order.getObjectKey())).withSelfRel());
		orderDto.add(selfLink);
		// PARENT LINKS
		if (order.getTheUser() != null) {
			Link userLink = convert(
					linkTo(methodOn(UserController.class).read(order.getTheUserObjectKey())).withRel("theUser"));
			orderDto.add(userLink);
		}
		// CHILDREN LINKS
		if (order.getTheOrderItem() != null) {
			Link orderItemLink = convert(
					linkTo(methodOn(OrderItemController.class).findByOrder(order.getObjectKey(), null))
							.withRel("theOrderItem"));
			orderDto.add(orderItemLink);
		}
		return orderDto;
	}
	// @Override
	// public CollectionModel<OrderDto> toCollectionModel(Iterable<? extends Order>
	// entities) {
	// CollectionModel<OrderDto> collectionEntities =
	// super.toCollectionModel(entities);
	// collectionEntities.add(linkTo(methodOn(OrdineController.class).findPaginated(null,
	// null)).withSelfRel());
	// return collectionEntities;
	// }
}

