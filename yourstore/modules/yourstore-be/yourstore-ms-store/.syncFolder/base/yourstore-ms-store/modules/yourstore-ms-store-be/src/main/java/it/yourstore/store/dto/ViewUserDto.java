package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Collection;
import javax.validation.constraints.NotNull;

/**
 * Data transfer object for view a data element of type User
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class ViewUserDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3181774896L;

	private String objectKey;
	private String objectTitle;

	private Integer userId;
	private Integer oauthId;
	private String name;
	private String surname;
	private String email;
	private Boolean isAdmin;

}
