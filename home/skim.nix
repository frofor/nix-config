{ colors, ... }:

{
  programs.skim = {
    enable = true;
    defaultOptions = [
      "--no-mouse"
      "--layout=reverse"
      "--color=none,matched:#${colors.red},current:#${colors.orange},cursor:#${colors.orange}"
    ];
  };
}
