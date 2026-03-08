{ pkgs, colors, ... }:

{
  programs.librewolf.profiles.default = {
    search = {
      default = "duckDuckGoHtml";
      engines = {
        duckDuckGoHtml = {
          name = "DuckDuckGo HTML";
          urls = [{ template = "https://html.duckduckgo.com/html?q={searchTerms}"; }];
        };
        movies = {
          name = "Movies";
          urls = [{ template = "https://themoviedb.org/search/movie?query={searchTerms}"; }];
          definedAliases = [ "@mo" ];
        };
        music = {
          name = "Music";
          urls = [{ template = "https://musicbrainz.org/search?query={searchTerms}&type=recording&method=indexed"; }];
          definedAliases = [ "@mu" ];
        };
        nixWiki = {
          name = "Nix Wiki";
          urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
          definedAliases = [ "@nw" ];
        };
        nixPackages = {
          name = "Nix Packages";
          urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
          definedAliases = [ "@np" ];
        };
        nixOptions = {
          name = "Nix Options";
          urls = [{ template = "https://mynixos.com/search?q=%2foption%2f+{searchTerms}"; }];
          definedAliases = [ "@no" ];
        };
        nixvimOptions = {
          name = "Nixvim Options";
          urls = [{ template = "https://nix-community.github.io/nixvim/NeovimOptions/index.html?search={searchTerms}"; }];
          definedAliases = [ "@nvo" ];
        };
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
      packages = with pkgs.nur.repos.rycee.firefox-addons; [ darkreader ublock-origin vimium ];
      settings = {
        "uBlock0@raymondhill.net".force = true;
        "addon@darkreader.org".force = true;
        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          settings = {
            regexFindMode = true;
            grabBackFocus = true;
          };
          force = true;
        };
      };
      force = true;
    };
    userChrome = ''
      :root {
          --tab-block-margin: none !important;
          --tab-overflow-clip-margin: none !important;
          --tab-selected-bgcolor: #${colors.orange} !important;
          --tab-selected-textcolor: #${colors.black} !important;
          --toolbox-bgcolor: #${colors.black} !important;
          --toolbox-bgcolor-inactive: #${colors.black} !important;
          --toolbar-bgcolor: #${colors.black} !important;
      }

      .tabbrowser-tab[selected] {
          --button-icon-fill: #${colors.black} !important;
      }

      .tabbrowser-tab .close-icon,
      #tabbrowser-arrowscrollbox-periphery,
      #alltabs-button,
      .titlebar-buttonbox-container,
      #urlbar-go-button,
      #star-button-box {
          display: none !important;
      }

      #nav-bar {
          border-bottom: 1px solid #${colors.orange} !important;
      }

      * {
          animation: none !important;
          border-radius: 0 !important;
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
          border-radius: 0 !important;
          transition: none !important;
      }
    '';
    settings = {
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.display.use_document_fonts" = 0;
      "browser.download.always_ask_before_handling_new_types" = true;
      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      "browser.newtabpage.activity-stream.showSearch" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      "browser.search.separatePrivateDefault" = false;
      "browser.tabs.hoverPreview.enabled" = false;
      "browser.toolbars.bookmarks.visibility" = "newtab";
      "network.trr.mode" = 3;
      "network.trr.uri" = "https://dns.quad9.net/dns-query"; # Quad9 (Malware blocking)
      "privacy.donottrackheader.enabled" = true;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
