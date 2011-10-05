# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-fontsextra/texlive-fontsextra-2010.ebuild,v 1.8 2011/10/04 18:20:03 jer Exp $

EAPI="3"

TEXLIVE_MODULE_CONTENTS="Asana-Math adforn adfsymbols allrunes antiqua antt apl ar archaic arev ascii astro augie auncial-new aurical barcodes baskervald bbding bbm bbm-macros bbold belleek bera berenisadf blacklettert1 boisik bookhands braille brushscr calligra carolmin-ps ccicons cfr-lm cherokee cm-lgc cm-unicode cmbright cmll cmpica concmath-fonts courier-scaled cryst cyklop dancers dice dictsym dingbat doublestroke dozenal duerer duerer-latex ean ecc eco eiad eiad-ltx electrum elvish epigrafica epsdice esvect eulervm euxm feyn fge foekfont fonetika fourier fouriernc frcursive genealogy gentium gfsartemisia gfsbodoni gfscomplutum gfsdidot gfsneohellenic gfssolomos gillcm gnu-freefont gothic greenpoint groff grotesq hands hfbright hfoldsty ifsym inconsolata initials iwona jablantile jamtimes junicode kixfont knuthotherfonts kpfonts kurier lfb libertine libris linearA logic lxfonts ly1 mathabx mathdesign mdputu mnsymbol nkarta ocherokee ogham oinuit oldlatin oldstandard orkhun osmanian pacioli phaistos phonetic pigpen poltawski psafm punk punknova recycle romande sauter sauterfonts semaphor simpsons skull staves starfont stix tapir tengwarscript tfrupee tpslifonts trajan txfontsb umtypewriter universa venturisadf wsuipa xits yfonts zefonts collection-fontsextra
"
TEXLIVE_MODULE_DOC_CONTENTS="Asana-Math.doc adforn.doc adfsymbols.doc allrunes.doc antiqua.doc antt.doc ar.doc archaic.doc arev.doc ascii.doc astro.doc augie.doc auncial-new.doc aurical.doc barcodes.doc baskervald.doc bbding.doc bbm.doc bbm-macros.doc bbold.doc belleek.doc bera.doc berenisadf.doc blacklettert1.doc boisik.doc bookhands.doc braille.doc brushscr.doc calligra.doc carolmin-ps.doc ccicons.doc cfr-lm.doc cm-lgc.doc cm-unicode.doc cmbright.doc cmll.doc cmpica.doc concmath-fonts.doc courier-scaled.doc cryst.doc cyklop.doc dice.doc dictsym.doc dingbat.doc doublestroke.doc dozenal.doc duerer.doc duerer-latex.doc ean.doc ecc.doc eco.doc eiad.doc eiad-ltx.doc electrum.doc elvish.doc epigrafica.doc epsdice.doc esvect.doc eulervm.doc feyn.doc fge.doc foekfont.doc fonetika.doc fourier.doc fouriernc.doc frcursive.doc genealogy.doc gentium.doc gfsartemisia.doc gfsbodoni.doc gfscomplutum.doc gfsdidot.doc gfsneohellenic.doc gfssolomos.doc gillcm.doc gnu-freefont.doc gothic.doc greenpoint.doc grotesq.doc hfbright.doc hfoldsty.doc ifsym.doc inconsolata.doc initials.doc iwona.doc jablantile.doc jamtimes.doc junicode.doc kixfont.doc kpfonts.doc kurier.doc lfb.doc libertine.doc libris.doc linearA.doc lxfonts.doc ly1.doc mathabx.doc mathdesign.doc mdputu.doc mnsymbol.doc nkarta.doc ocherokee.doc ogham.doc oinuit.doc oldlatin.doc oldstandard.doc orkhun.doc pacioli.doc phaistos.doc phonetic.doc pigpen.doc poltawski.doc punknova.doc recycle.doc romande.doc sauterfonts.doc semaphor.doc staves.doc starfont.doc stix.doc tapir.doc tengwarscript.doc tfrupee.doc tpslifonts.doc trajan.doc txfontsb.doc universa.doc venturisadf.doc wsuipa.doc xits.doc yfonts.doc zefonts.doc "
TEXLIVE_MODULE_SRC_CONTENTS="allrunes.source apl.source archaic.source arev.source ascii.source auncial-new.source barcodes.source baskervald.source bbding.source bbm-macros.source bbold.source belleek.source berenisadf.source blacklettert1.source bookhands.source brushscr.source ccicons.source cfr-lm.source cmbright.source cmll.source dingbat.source dozenal.source eco.source eiad-ltx.source electrum.source epsdice.source esvect.source eulervm.source feyn.source fge.source fourier.source frcursive.source gentium.source gnu-freefont.source hfbright.source hfoldsty.source inconsolata.source libris.source linearA.source mnsymbol.source nkarta.source oinuit.source oldstandard.source pacioli.source phaistos.source romande.source sauterfonts.source skull.source staves.source tengwarscript.source tfrupee.source trajan.source txfontsb.source universa.source venturisadf.source xits.source yfonts.source "
inherit texlive-module
DESCRIPTION="TeXLive Extra fonts"

LICENSE="GPL-2 as-is BSD GPL-1 GPL-2 GPL-3 LPPL-1.3 OFL public-domain TeX "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~ppc-macos"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2010
!=dev-texlive/texlive-langpolish-2007*
"
RDEPEND="${DEPEND} "
