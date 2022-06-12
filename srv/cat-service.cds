using my.bookshop as my from '../db/data-model';

service CatalogServiceLatest @(requires : ['authenticated-user']) {
    @readonly
    entity Books @(restrict : [{
        grant : ['READ'],
        to    : 'ADMIN'
    }]) as projection on my.Books;

    function sendMessage() returns String;
}
