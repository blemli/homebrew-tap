import glob, re

readme = open("README.md").read()
for section in ["Casks", "Formulae"]:
    programs = []
    for f in sorted(glob.glob(f"{section}*/*.rb")):
        rb = open(f).read()
        names = re.findall(r'name\s+"(.+?)"', rb)
        homepages = re.findall(r'homepage\s+"(.+?)"', rb)
        if names and homepages:
            programs.append(f"- [{names[0]}]({homepages[0]})")
    if programs:
        readme = re.sub(
            rf"(## {section}\n)\n[\s\S]*?(?=\n## |\Z)",
            rf"\1\n" + "\n".join(programs) + "\n",
            readme,
        )
open("README.md", "w").write(readme)
