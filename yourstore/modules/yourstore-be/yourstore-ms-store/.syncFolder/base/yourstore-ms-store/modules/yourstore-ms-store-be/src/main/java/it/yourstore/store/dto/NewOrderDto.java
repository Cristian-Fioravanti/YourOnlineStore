package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.time.LocalDate;
import java.util.Collection;
import javax.validation.constraints.NotNull;

/**
 * Data transfer object for creation of a new data element of type Order
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class NewOrderDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1625209308L;

	private String objectKey;

	private Integer orderId;
	private LocalDate date;
	private Integer totalCost;
	private String address;
	@NotNull(message = "User's ID required: it cannot be null")
	private String theUserObjectKey;

	private Collection<NewOrderItemDto> theOrderItem;

}
