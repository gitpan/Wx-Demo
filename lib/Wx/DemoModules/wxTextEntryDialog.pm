#############################################################################
## Name:        lib/Wx/DemoModules/wxTextEntryDialog.pm
## Purpose:     wxPerl demo helper for Wx::TextEntryDialog
## Author:      Mattia Barbon
## Modified by:
## Created:     11/02/2001
## RCS-ID:      $Id: wxTextEntryDialog.pm 2189 2007-08-21 18:15:31Z mbarbon $
## Copyright:   (c) 2001, 2003, 2006 Mattia Barbon
## Licence:     This program is free software; you can redistribute it and/or
##              modify it under the same terms as Perl itself
#############################################################################

package Wx::DemoModules::wxTextEntryDialog;

use strict;
use base qw(Wx::DemoModules::lib::BaseModule Class::Accessor::Fast);

use Wx qw(:id);

sub commands {
    my( $self ) = @_;

    return ( { label       => 'Text entry dialog',
               action      => \&text_entry_dialog,
               },
               );
}

sub text_entry_dialog {
  my( $this ) = @_;
  my $dialog = Wx::TextEntryDialog->new
    ( $this, "Enter som text", "Wx::TextEntryDialog sample",
      "I am a default value" );

  if( $dialog->ShowModal == wxID_CANCEL ) {
    Wx::LogMessage( "User cancelled the dialog" );
  } else {
    Wx::LogMessage( "Text: %s", $dialog->GetValue );
  }

  $dialog->Destroy;
}

sub add_to_tags { qw(dialogs) }
sub title { 'wxTextEntryDialog' }

1;
