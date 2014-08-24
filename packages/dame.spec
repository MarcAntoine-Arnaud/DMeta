Name: dame
License: lgpl-v3.0
Summary: Automated Metadata Extractor
Version: 0.0.1
Release: 0
Group: Applications/File
BuildRequires: scons >= 2.3.0
BuildRequires: dmd
Source: %{name}-%{version}-%{release}src.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}

%description
Extractor of media files, based on specification files in human readable format.

%clean
scons -c
rm -Rf build dist .scon*

%prep
[ -n "$RPM_BUILD_ROOT" -a "$RPM_BUILD_ROOT" != / ] && rm -rf "$RPM_BUILD_ROOT"
%setup -q

%build
scons

%install
scons --install-sandbox="$RPM_BUILD_ROOT"

%post
ldconfig

%postun
ldconfig

%files
%defattr (-,root,root)
%{_bindir}/dame
%{_mandir}/man1/dame.man.gz

%changelog
* Sun Aug 24 2014 - arnaud.marcantoine@gmail.com
- first release of packaging
