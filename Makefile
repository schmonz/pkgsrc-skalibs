# $NetBSD: Makefile,v 1.25 2024/02/28 22:56:04 schmonz Exp $

DISTNAME=		skalibs-2.14.1.1
CATEGORIES=		devel
MASTER_SITES=		${HOMEPAGE}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://skarnet.org/software/skalibs/
COMMENT=		The skarnet.org C system programming library
LICENSE=		isc

USE_LANGUAGES=		c
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake
USE_LIBTOOL=		yes

CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}

# for fdopendir
CPPFLAGS.NetBSD+=	-D_NETBSD_SOURCE
CPPFLAGS.SunOS+=	-D__EXTENSIONS__

# from patch-for-solaris
SUBST_CLASSES.SunOS+=	solaris
SUBST_STAGE.solaris=	pre-configure
SUBST_FILES.solaris=	configure
SUBST_SED.solaris=	-e 's|XOPEN_SOURCE=700|XOPEN_SOURCE=600|g'

INSTALLATION_DIRS=	include/skalibs lib/skalibs/sysdeps

post-install:
	${LN} -sf ../libskarnet.a ${DESTDIR}${PREFIX}/lib/skalibs/libskarnet.a

.include "../../mk/bsd.pkg.mk"
