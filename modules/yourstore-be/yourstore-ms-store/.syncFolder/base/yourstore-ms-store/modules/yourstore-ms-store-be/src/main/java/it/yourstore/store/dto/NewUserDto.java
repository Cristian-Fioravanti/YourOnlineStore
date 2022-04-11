package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Collection;
import javax.validation.constraints.NotNull;

/**
 * Data transfer object for creation of a new data element of type User
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class NewUserDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3181774896L;

	private String objectKey;

	private Integer userId;
	private Integer oauthId;
	private String name;
	private String surname;
	private String email;
	private Boolean isAdmin;

	private Collection<NewOrderDto> theOrder;

}
