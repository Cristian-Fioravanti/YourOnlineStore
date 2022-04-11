package it.yourstore.store.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import it.yourstore.store.controller.ProductController;
import it.yourstore.store.dto.ViewProductDto;
import it.yourstore.store.domain.Product;
import it.yourstore.store.mapper.ProductMappers;

import it.yourstore.store.controller.OrderItemController;

@RequiredArgsConstructor
@Component
public class ProductModelAssembler extends BaseModelAssembler<Product, ViewProductDto> {
	private final ProductMappers productMappers;

	@Override
	public ViewProductDto toModel(Product product) {
		ViewProductDto productDto = productMappers.map(product);
		// SELF LINK
		Link selfLink = convert(linkTo(methodOn(ProductController.class).read(product.getObjectKey())).withSelfRel());
		productDto.add(selfLink);
		// PARENT LINKS
		// CHILDREN LINKS
		if (product.getTheOrderItem() != null) {
			Link orderItemLink = convert(
					linkTo(methodOn(OrderItemController.class).findByProduct(product.getObjectKey(), null))
							.withRel("theOrderItem"));
			productDto.add(orderItemLink);
		}
		return productDto;
	}
	// @Override
	// public CollectionModel<ProductDto> toCollectionModel(Iterable<? extends
	// Product> entities) {
	// CollectionModel<ProductDto> collectionEntities =
	// super.toCollectionModel(entities);
	// collectionEntities.add(linkTo(methodOn(OrdineController.class).findPaginated(null,
	// null)).withSelfRel());
	// return collectionEntities;
	// }
}

