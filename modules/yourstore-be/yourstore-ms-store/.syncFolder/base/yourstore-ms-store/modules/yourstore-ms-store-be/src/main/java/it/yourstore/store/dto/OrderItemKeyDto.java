package it.yourstore.store.dto;

import javax.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import it.yourstore.store.domain.OrderItemKey;

import it.micegroup.voila2runtime.dto.GenericDto;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrderItemKeyDto extends GenericDto {
	private String theOrderObjectKey;
	private String theOrderObjectTitle;
	private String theProductObjectKey;
	private String theProductObjectTitle;
}
