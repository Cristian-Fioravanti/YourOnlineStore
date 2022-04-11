package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * Data transfer object for creation of a new data element of type OrderItem
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class NewOrderItemDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 612176311L;

	private String objectKey;

	@NotNull(message = "Required attribute: it cannot be null")
	private Integer amount;

	@NotNull(message = "ID not auto-generated: it cannot be null")
	private OrderItemKeyDto orderItemKey;
}
