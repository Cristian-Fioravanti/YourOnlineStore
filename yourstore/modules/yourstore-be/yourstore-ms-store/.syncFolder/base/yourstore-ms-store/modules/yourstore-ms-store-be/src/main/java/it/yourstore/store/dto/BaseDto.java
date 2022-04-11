package it.yourstore.store.dto;

import java.io.Serializable;
import org.springframework.hateoas.RepresentationModel;
import it.micegroup.voila2runtime.object.GenericObject;

public abstract class BaseDto extends RepresentationModel<BaseDto> implements Serializable {

	private static final long serialVersionUID = 4194007193178138872L;

}
