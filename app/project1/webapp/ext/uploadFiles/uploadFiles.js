sap.ui.define(
  ["sap/m/MessageToast", "sap/ui/core/mvc/View"],
  function (MessageToast, View) {
    "use strict";

    return {
      uploadFiles: function () {
        var oView = this.editFlow.getView();
        var oDialog = oView.byId("app");
        if (!oDialog) {
          View.create({
            viewName: "project1.view.App",
            type: sap.ui.core.mvc.ViewType.XML,
          }).then(function (oDialogView) {
            oView.addDependent(oDialogView);
            oDialog = oDialogView.byId("dialog");
            if (oDialog) {
              oDialog.open();
            } else {
              console.error("Error");
            }
          });
        } else {
          oDialog.open();
        }
      },
    };
  }
);
