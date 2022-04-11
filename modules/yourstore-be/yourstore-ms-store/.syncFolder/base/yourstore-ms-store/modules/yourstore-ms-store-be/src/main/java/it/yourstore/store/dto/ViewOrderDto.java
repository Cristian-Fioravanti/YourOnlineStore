package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.time.LocalDate;
import java.util.Collection;
import javax.validation.constraints.NotNull;

/**
 * Data transfer object for view a data element of type Order
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class ViewOrderDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1625209308L;

	private String objectKey;
	private String objectTitle;

	private Integer orderId;
	private LocalDate date;
	private Integer totalCost;
	private String address;
	private String theUserObjectKey;
	private String theUserObjectTitle;

}
