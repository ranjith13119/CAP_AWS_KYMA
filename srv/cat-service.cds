using my.bookshop as my from '../db/data-model';

service CatalogServiceLatest {
    @readonly entity Books as projection on my.Books;
}
