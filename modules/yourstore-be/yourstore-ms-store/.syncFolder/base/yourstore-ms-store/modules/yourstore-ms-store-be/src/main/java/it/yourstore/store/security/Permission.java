package it.yourstore.store.security;

import org.springframework.stereotype.Component;

@Component("permissionHolder")
public final class Permission {
	/// User
	public static final int USER_SEARCH = 164968461921338650;
	public static final int USER_READ = 164968461921338651;
	public static final int USER_CREATE = 164968461921338652;
	public static final int USER_UPDATE = 164968461921338653;
	public static final int USER_DELETE = 164968461921338654;
	public static final int USER_REPORT = 164968461921338655;

	public static final int USER_FIND_BY_THE_ORDER_OBJECT_KEY = 1649684619213386562;

	/// Order
	public static final int ORDER_SEARCH = 164968461921325620;
	public static final int ORDER_READ = 164968461921325621;
	public static final int ORDER_CREATE = 164968461921325622;
	public static final int ORDER_UPDATE = 164968461921325623;
	public static final int ORDER_DELETE = 164968461921325624;
	public static final int ORDER_REPORT = 164968461921325625;

	public static final int ORDER_FIND_BY_USER = 1649684619213256265;
	public static final int ORDER_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY = 1649684619213256250;

	/// OrderItem
	public static final int ORDER_ITEM_SEARCH = 164968461921311500;
	public static final int ORDER_ITEM_READ = 164968461921311501;
	public static final int ORDER_ITEM_CREATE = 164968461921311502;
	public static final int ORDER_ITEM_UPDATE = 164968461921311503;
	public static final int ORDER_ITEM_DELETE = 164968461921311504;
	public static final int ORDER_ITEM_REPORT = 164968461921311505;

	public static final int ORDER_ITEM_FIND_BY_ORDER = 1649684619213115062;
	public static final int ORDER_ITEM_FIND_BY_PRODUCT = 1649684619213115030;

	/// Product
	public static final int PRODUCT_SEARCH = 164968461921398300;
	public static final int PRODUCT_READ = 164968461921398301;
	public static final int PRODUCT_CREATE = 164968461921398302;
	public static final int PRODUCT_UPDATE = 164968461921398303;
	public static final int PRODUCT_DELETE = 164968461921398304;
	public static final int PRODUCT_REPORT = 164968461921398305;

	public static final int PRODUCT_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY = 1649684619213983050;

}

