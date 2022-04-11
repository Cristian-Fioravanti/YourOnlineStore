package it.yourstore.store.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import it.yourstore.store.controller.OrderItemController;
import it.yourstore.store.dto.ViewOrderItemDto;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.mapper.OrderItemMappers;

import it.yourstore.store.controller.OrderController;
import it.yourstore.store.controller.ProductController;

@RequiredArgsConstructor
@Component
public class OrderItemModelAssembler extends BaseModelAssembler<OrderItem, ViewOrderItemDto> {
	private final OrderItemMappers orderItemMappers;

	@Override
	public ViewOrderItemDto toModel(OrderItem orderItem) {
		ViewOrderItemDto orderItemDto = orderItemMappers.map(orderItem);
		// SELF LINK
		Link selfLink = convert(
				linkTo(methodOn(OrderItemController.class).read(orderItem.getObjectKey())).withSelfRel());
		orderItemDto.add(selfLink);
		// PARENT LINKS
		if (orderItem.getTheOrder() != null) {
			Link orderLink = convert(
					linkTo(methodOn(OrderController.class).read(orderItem.getTheOrderObjectKey())).withRel("theOrder"));
			orderItemDto.add(orderLink);
		}
		if (orderItem.getTheProduct() != null) {
			Link productLink = convert(
					linkTo(methodOn(ProductController.class).read(orderItem.getTheProductObjectKey()))
							.withRel("theProduct"));
			orderItemDto.add(productLink);
		}
		// CHILDREN LINKS
		return orderItemDto;
	}
	// @Override
	// public CollectionModel<OrderItemDto> toCollectionModel(Iterable<? extends
	// OrderItem> entities) {
	// CollectionModel<OrderItemDto> collectionEntities =
	// super.toCollectionModel(entities);
	// collectionEntities.add(linkTo(methodOn(OrdineController.class).findPaginated(null,
	// null)).withSelfRel());
	// return collectionEntities;
	// }
}

