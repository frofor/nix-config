{
  mkScript = name: text: {
    home.file."documents/scripts/${name}" = {
      text = ''
        #!/bin/sh
        ${text}
      '';
      executable = true;
    };
  };
  mkScriptLocalBin = name: text: {
    home.file.".local/bin/${name}" = {
      text = ''
        #!/bin/sh
        ${text}
      '';
      executable = true;
    };
  };
}
