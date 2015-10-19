//
//  TLImageMessageCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLImageMessageCell.h"

@implementation TLImageMessageCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self insertSubview:self.messageImageView belowSubview:self.messageBackgroundImageView];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
<<<<<<< HEAD
    float x = self.avatarImageView.originX + (self.message.ownerTyper == TLMessageOwnerTypeSelf ? - self.messageImageView.frameWidth - 12 : self.avatarImageView.frameWidth + 12);
    [self.messageImageView setOrigin:CGPointMake(x, self.avatarImageView.originY)];
    [self.messageBackgroundImageView setFrame:CGRectMake(x - 8, self.avatarImageView.originY - 5, self.messageImageView.frameWidth + 16, self.messageImageView.frameHeight
                                                         )];
=======
    float y = self.avatarImageView.originY - 3;
    if (self.message.ownerTyper == TLMessageOwnerTypeSelf) {
        float x = self.avatarImageView.originX - self.messageImageView.frameWidth - 5;
        [self.messageImageView setOrigin:CGPointMake(x , y)];
        [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.message.messageSize.width+ 10, self.message.messageSize.height + 10)];
    }
    else if (self.message.ownerTyper == TLMessageOwnerTypeOther) {
        float x = self.avatarImageView.originX + self.avatarImageView.frameWidth + 5;
        [self.messageImageView setOrigin:CGPointMake(x, y)];
        [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.message.messageSize.width+ 10, self.message.messageSize.height + 10)];
    }
>>>>>>> 1715c332b6b2c87253279e923dba832a84796bff
}

#pragma mark - Getter and Setter
- (void) setMessage:(TLMessage *)message
{
    [super setMessage:message];
    if(message.imagePath != nil) {
        [self.messageImageView setImage:[UIImage imageNamed:message.imagePath]];
        [self.messageImageView setSize:CGSizeMake(message.messageSize.width + 10, message.messageSize.height + 10)];
    }
    switch (self.message.ownerTyper) {
        case TLMessageOwnerTypeSelf:
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_sender_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        case TLMessageOwnerTypeOther:
            [self.messageBackgroundImageView setImage:[[UIImage imageNamed:@"message_receiver_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch]];
            break;
        default:
            break;
    }
}

- (UIImageView *) messageImageView
{
    if (_messageImageView == nil) {
        _messageImageView = [[UIImageView alloc] init];
    }
    return _messageImageView;
}


@end