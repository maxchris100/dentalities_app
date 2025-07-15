class Paging {
  int page;
  int limit;
  bool isCanNext;

  Paging({this.page = 1, this.limit = 100, this.isCanNext = false});

  void setPage(int page) {
    this.page = page;
  }
}
