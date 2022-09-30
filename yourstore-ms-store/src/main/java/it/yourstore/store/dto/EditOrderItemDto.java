package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * Data transfer object for edit a data element of type OrderItem
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class EditOrderItemDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 2771621724L;

	private Integer amount;

	@NotNull
	private String theOrdineObjectKey;

	@NotNull
	private String theProductObjectKey;

}
