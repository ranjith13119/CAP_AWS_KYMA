const cds = require("@sap/cds");

class CatalogServiceLatest extends cds.ApplicationService {
    async init() {

        this.on("sendMessage", async (req) => {
            return "Successfully triggered the function call."
        });
        return super.init();
    }
}

module.exports = {
    CatalogServiceLatest,
};