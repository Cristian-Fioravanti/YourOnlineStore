package it.yourstore.store.mapper;

import it.yourstore.store.dto.NewOrderDto;
import it.yourstore.store.dto.EditOrderDto;
import it.yourstore.store.dto.ViewOrderDto;
import it.yourstore.store.domain.Order;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import java.util.Optional;

@Mapper
public interface OrderMappers {

	Order map(NewOrderDto orderDto);

	Order map(EditOrderDto orderDto);

	ViewOrderDto map(Order order);

	default Page<ViewOrderDto> map(Page<Order> page) {
		return page.map(this::map);
	}

	default Optional<ViewOrderDto> map(Optional<Order> read) {
		return read.map(this::map);
	}
}
