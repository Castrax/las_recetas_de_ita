import "bootstrap";
import 'bootstrap/dist/js/bootstrap.bundle';

import { initSelect2 } from '../plugins/init_select2';
import { previewImageOnFileSelect } from "../components/photo_preview";
import { steps } from "../components/steps";
import { initSweetalert } from '../plugins/init_sweetalert';

initSelect2();
previewImageOnFileSelect();
steps();

initSweetalert('#sweet-alert-destroy-recipe', {
  title: "Supprimer ta recette",
  text: "Es-tu sûre de vouloir supprimer ta recette ?",
  dangerMode: true
}, (value) => {
  if (value) {
      const link = document.querySelector('#delete-link');
      link.click();
    }
});
