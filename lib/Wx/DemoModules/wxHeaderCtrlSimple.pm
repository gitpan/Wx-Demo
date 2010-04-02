#############################################################################
## Name:        lib/Wx/DemoModules/wxHeaderCtrlSimple.pm
## Purpose:     wxPerl demo helper for Wx::HeaderCtrlSimple
## Author:      Mattia Barbon
## Modified by:
## Created:     20/02/2010
## RCS-ID:      $Id: wxSpinCtrl.pm 2189 2007-08-21 18:15:31Z mbarbon $
## Copyright:   (c) 2010 Mattia Barbon
## Licence:     This program is free software; you can redistribute it and/or
##              modify it under the same terms as Perl itself
#############################################################################

package Wx::DemoModules::wxHeaderCtrlSimple;

use strict;
use base qw(Wx::DemoModules::lib::BaseModule Class::Accessor::Fast);

#use Wx qw(:headerctrl);
#use Wx::Event qw(EVT_SPINCTRL EVT_SPIN EVT_SPIN_DOWN EVT_SPIN_UP);

__PACKAGE__->mk_accessors( qw(headerctrl) );

# sub styles {
#     my( $self ) = @_;

#     return ( [ wxSP_ARROW_KEYS, 'Allow arrow keys' ],
#              [ wxSP_WRAP, 'Wrap' ],
#              );
# }

sub commands {
    my( $self ) = @_;

    return ( { with_value  => 1,
               label       => 'Append Column',
               action      => sub { my $col = Wx::HeaderColumnSimple->new( $_[0], 100 );
                                    $self->headerctrl->AppendColumn( $col ) },
               },
               );
}

sub create_control {
    my( $self ) = @_;

    my $headerctrl =Wx::DemoModules::wxHeaderCtrlSimple::Control->new( $self, -1, [-1, -1], [-1, -1] );
#                                                $self->style );
    $headerctrl->AppendColumn( Wx::HeaderColumnSimple->new( 'Column1', 120 ) );
    $headerctrl->AppendColumn( Wx::HeaderColumnSimple->new( 'Column2', 80 ) );
    $headerctrl->AppendColumn( Wx::HeaderColumnSimple->new( 'Column3', 100 ) );

#    EVT_SPINCTRL( $self, $spinctrl, \&OnSpinCtrl );

    return $self->headerctrl( $headerctrl );
}

# sub OnSpinCtrl {
#     my( $self, $event ) = @_;

#     Wx::LogMessage( "Spin ctrl changed: now %d (from event %d)",
#                     $self->spinctrl->GetValue,
#                     $event->GetInt );
# }

sub add_to_tags { qw(controls new) }
sub title { 'wxHeaderCtrlSimple' }

package Wx::DemoModules::wxHeaderCtrlSimple::Control;

use strict;
use base qw(Wx::HeaderCtrlSimple);

# called when the column border is double-clicked to auto-resize
sub GetBestFittingWidth {
    my( $self, $idx ) = @_;

    return 200;
}

1;
