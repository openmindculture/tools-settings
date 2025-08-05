/* customization 2024  */
/* add inside a <script> element in  Divi > Theme Options > Integration tab > head */

window.addEventListener('DOMContentLoaded', function() {
    if (typeof document.body.classList === 'undefined') {
        return;
    }
    var moreButtons = document.getElementsByClassName('mydivi_more_button');
    for (var i = 0; i < moreButtons.length; i++) {
        var moreButton = moreButtons[i];
        if (moreButton.closest('.et_fb_edit_enabled')) {
            continue;
        }
        moreButton.onclick = function(event) {
            event.preventDefault();
            var moreWrapper = event.target.closest('.mydivi_more_container');
            if (!moreWrapper) {
                moreWrapper = moreButton.closest('.et_pb_blurb_description');
            }
            var moreContent = moreWrapper.querySelector('.mydivi_more_content');
            if (moreContent) {
                moreContent.classList.remove('initially-hidden');
                event.target.classList.add('hidden');
            }
            /* hide other elements here for accordion effect */
        }
    }

    var lessButtons = document.getElementsByClassName('mydivi_less_button');
    for (var k = 0; k < lessButtons.length; k++) {
        var lessButton = lessButtons[k];
        if (lessButton.closest('.et_fb_edit_enabled')) {
            continue;
        }
        lessButton.onclick = function(event) {
            event.preventDefault();
            var moreContent = event.target.closest('.mydivi_more_content');
            if (moreContent) {
                moreContent.classList.add('initially-hidden');
                var moreButton = moreContent.parentElement.querySelector('.mydivi_more_button');
                if (moreButton) {
                    moreButton.classList.remove('hidden');
                }
            }
        }
    }
});