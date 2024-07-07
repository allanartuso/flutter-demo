const defaultPage = 1;
const defaultPageSize = 10;

/// The options required to make a resource request for paged resources.
/// This defines which page and how many resources per page to return.
class PagingOptions {
  final int page;
  final int pageSize;

  const PagingOptions({
    this.page = defaultPage,
    this.pageSize = defaultPageSize,
  });
}
