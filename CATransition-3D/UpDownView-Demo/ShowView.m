//
//  ShowView.m
//  UpDownView-Demo
//
//  Created by 张建 on 2017/4/24.
//  Copyright © 2017年 JuZiShu. All rights reserved.
//

#import "ShowView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

@interface ShowView ()

@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * dateLabel;

@end

@implementation ShowView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self initUI];
    }
    
    return self;
}

- (void)initUI{
    
    //icon
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self).offset(10);
        make.width.height.mas_equalTo(40);
    }];
    
    //title
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor magentaColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = RGB(149, 149, 149);
    _titleLabel.numberOfLines = 2;
    [_titleLabel sizeToFit];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
        make.right.mas_equalTo(self.mas_right).offset(-80);
    }];
    
    //date
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.backgroundColor = [UIColor orangeColor];
    _dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:33];
    [self addSubview:_dateLabel];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_titleLabel.mas_right).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.bottom.right.equalTo(self).offset(-10);
    }];
    
}

- (void)setModel:(UpDownModel *)model{
    _model = model;
    
    //icon
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_model.pic] placeholderImage:[UIImage imageNamed:@""]];
    
    //title
    _titleLabel.text = _model.title;
    
    //date
    _dateLabel.text = _model.detail;
}

@end
