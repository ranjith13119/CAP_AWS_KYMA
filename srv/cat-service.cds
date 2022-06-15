using my.bookshop as my from '../db/data-model';

service CatalogServiceLatest {
    entity Books as projection on my.Books;
    function sendMessage() returns String;
}
