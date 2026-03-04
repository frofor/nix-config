{ pkgs, colors, ... }:

{
  programs.librewolf.profiles.i2p = {
    id = 1;
    search = {
      engines = {
        bing.metaData.hidden = true;
        google.metaData.hidden = true;
        perplexity.metaData.hidden = true;
        wikipedia.metaData.hidden = true;
      };
      force = true;
    };
    bookmarks = {
      settings = [ ];
      force = true;
    };
    containersForce = true;
    extensions = {
      packages = with pkgs.nur.repos.rycee.firefox-addons; [ darkreader ublock-origin ];
      settings = {
        "uBlock0@raymondhill.net".force = true;
        "addon@darkreader.org".force = true;
        # Ocean blue
        "{750fa518-b61f-4068-9974-330dcf45442f}".force = true;
      };
      force = true;
    };
    userChrome = ''
      * {
          animation: none !important;
          border-radius: 0px !important;
          transition: none !important;
      }
    '';
    userContent = ''
      :root {
          --background-color-canvas: #${colors.black} !important;
          --newtab-background-color: #${colors.black} !important;
      }

      .personalizeButtonWrapper {
          display: none !important;
      }

      *,
      *::before,
      *::after {
          animation: none !important;
          border-radius: 0px !important;
          transition: none !important;
      }
    '';
    settings = {
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.download.always_ask_before_handling_new_types" = true;
      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      "browser.newtabpage.activity-stream.showSearch" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      "browser.search.separatePrivateDefault" = false;
      "browser.tabs.hoverPreview.enabled" = false;
      "browser.toolbars.bookmarks.visibility" = "newtab";
      "javascript.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.resistFingerprinting.letterboxing" = true;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
