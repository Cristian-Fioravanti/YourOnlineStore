package it.yourstore.store.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import org.springframework.beans.factory.annotation.Value;

import org.springframework.hateoas.Link;
import org.springframework.hateoas.LinkRelation;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.RepresentationModelAssembler;

import it.yourstore.store.domain.BaseEntity;

import java.net.URI;

public abstract class BaseModelAssembler<M extends BaseEntity, D extends RepresentationModel<?>>
		implements RepresentationModelAssembler<M, D> {

	@Value("${gateway.baseuri}")
	private String baseUri;

	protected BaseModelAssembler() {
	}

	protected Link convert(Link link) {
		return Link.of(convertLink(link.getHref()), link.getRel());
	}

	private String convertLink(String href) {
		URI uri = URI.create(href);
		return baseUri + uri.getPath();
	}

}

