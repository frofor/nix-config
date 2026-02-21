{ pkgs, ... }:

{
  programs.librewolf.profiles.default = {
    search = {
      engines = {
        duckDuckGo = {
          name = "DuckDuckGo";
          urls = [{ template = "https://noai.duckduckgo.com?q={searchTerms}"; }];
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
          urls = [{
            template =
              "https://nix-community.github.io/nixvim/NeovimOptions/index.html?search={searchTerms}";
          }];
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
            newTabUrl = "pages/blank.html";
            regexFindMode = true;
            grabBackFocus = true;
          };
          force = true;
        };
        # Mossy green
        "{f9261f02-c03c-4352-92ee-78dd8b41ca98}".force = true;
      };
      force = true;
    };
    settings = {
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.download.always_ask_before_handling_new_types" = true;
      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      "browser.newtabpage.activity-stream.showSearch" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      "browser.search.separatePrivateDefault" = false;
      "browser.tabs.hoverPreview.enabled" = false;
      "network.trr.mode" = 3;
      "network.trr.uri" = "https://dns.quad9.net/dns-query"; # Quad9 (Malware blocking)
    };
  };
}
