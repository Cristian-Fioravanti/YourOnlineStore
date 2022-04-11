package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * Data transfer object for view a data element of type OrderItem
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class ViewOrderItemDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 612176311L;

	private String objectKey;
	private String objectTitle;

	private Integer amount;
	private String theOrderObjectTitle;
	private String theProductObjectTitle;

	private OrderItemKeyDto orderItemKey;
}
