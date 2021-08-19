/*

DATA VICTORIA API HELPER
-------------------------

The datastore_search action allows you to search data in a resource.
DataStore resources that belong to private CKAN resource can only be
read by you if you have access to the CKAN resource and send the
appropriate authorization.



@param resource_id: id or alias of the resource to be searched against
-- type resource_id: string

@param filters: matching conditions to select, e.g
	{\"key1\": \"a\", \"key2\": \"b\"} (optional)
-- type filters: dictionary

@param q: full text query. If it's a string, it'll search on all fields on
	each row. If it's a dictionary as {\"key1\": \"a\", \"key2\": \"b\"},
	it'll search on each specific field (optional)
-- type q: string or dictionary

@param distinct: return only distinct rows (optional, default: false)
-- type distinct: bool

@param plain: treat as plain text query (optional, default: true)
-- type plain: bool

@param language: language of the full text query
	(optional, default: english)
-- type language: string

@param limit: maximum number of rows to return (optional, default: 100)
-- type limit: int

@param offset: offset this number of rows (optional)
-- type offset: int

@param fields: fields to return
	(optional, default: all fields in original order)
-- type fields: list or comma separated string

@param sort: comma separated field names with ordering
	e.g.: \"fieldname1, fieldname2 desc\"
-- type sort: string

@param include_total: True to return total matching record count
	(optional, default: true)
-- type include_total: bool

@param records_format: the format for the records return value:
	'objects' (default) list of {fieldname1: value1, ...} dicts,
	'lists' list of [value1, value2, ...] lists,
	'csv' string containing comma-separated values with no header,
	'tsv' string containing tab-separated values with no header
-- type records_format: controlled list




Results:
------------

The result of this action is a dictionary with the following keys:

:type: A dictionary with the following keys

@param fields: fields/columns and their extra metadata
-- type fields: list of dictionaries

@param offset: query offset value
-- type offset: int

@param limit: query limit value
-- type limit: int

@param filters: query filters
-- type filters: list of dictionaries

@param total: number of total matching records
-- type total: int

@param records: list of matching results
-- type records: depends on records_format value passed

*/
