package it.yourstore.store.mapper;

import it.yourstore.store.dto.NewProductDto;
import it.yourstore.store.dto.EditProductDto;
import it.yourstore.store.dto.ViewProductDto;
import it.yourstore.store.domain.Product;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import java.util.Optional;

@Mapper
public interface ProductMappers {

	Product map(NewProductDto productDto);

	Product map(EditProductDto productDto);

	ViewProductDto map(Product product);

	default Page<ViewProductDto> map(Page<Product> page) {
		return page.map(this::map);
	}

	default Optional<ViewProductDto> map(Optional<Product> read) {
		return read.map(this::map);
	}
}
