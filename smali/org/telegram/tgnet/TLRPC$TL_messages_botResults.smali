.class public Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;
.super Lorg/telegram/tgnet/TLObject;
.source "TLRPC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/telegram/tgnet/TLRPC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TL_messages_botResults"
.end annotation


# static fields
.field public static constructor:I


# instance fields
.field public cache_time:I

.field public flags:I

.field public gallery:Z

.field public next_offset:Ljava/lang/String;

.field public query_id:J

.field public results:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$BotInlineResult;",
            ">;"
        }
    .end annotation
.end field

.field public switch_pm:Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16286
    const v0, -0x332ca9c3

    sput v0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->constructor:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16285
    invoke-direct {p0}, Lorg/telegram/tgnet/TLObject;-><init>()V

    .line 16293
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->results:Ljava/util/ArrayList;

    return-void
.end method

.method public static TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;
    .locals 6
    .param p0, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p1, "constructor"    # I
    .param p2, "exception"    # Z

    .prologue
    .line 16297
    sget v1, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->constructor:I

    if-eq v1, p1, :cond_1

    .line 16298
    if-eqz p2, :cond_0

    .line 16299
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "can\'t parse magic %x in TL_messages_botResults"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16301
    :cond_0
    const/4 v0, 0x0

    .line 16306
    :goto_0
    return-object v0

    .line 16304
    :cond_1
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;-><init>()V

    .line 16305
    .local v0, "result":Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;
    invoke-virtual {v0, p0, p2}, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V

    goto :goto_0
.end method


# virtual methods
.method public readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V
    .locals 10
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p2, "exception"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 16310
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    iput v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    .line 16311
    iget v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_2

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->gallery:Z

    .line 16312
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt64(Z)J

    move-result-wide v8

    iput-wide v8, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->query_id:J

    .line 16313
    iget v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_0

    .line 16314
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readString(Z)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->next_offset:Ljava/lang/String;

    .line 16316
    :cond_0
    iget v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_1

    .line 16317
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;

    move-result-object v4

    iput-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->switch_pm:Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;

    .line 16319
    :cond_1
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v2

    .line 16320
    .local v2, "magic":I
    const v4, 0x1cb5c415

    if-eq v2, v4, :cond_3

    .line 16321
    if-eqz p2, :cond_4

    .line 16322
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "wrong Vector magic, got %x"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v7, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "magic":I
    :cond_2
    move v4, v6

    .line 16311
    goto :goto_0

    .line 16326
    .restart local v2    # "magic":I
    :cond_3
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v1

    .line 16327
    .local v1, "count":I
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_1
    if-ge v0, v1, :cond_6

    .line 16328
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$BotInlineResult;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$BotInlineResult;

    move-result-object v3

    .line 16329
    .local v3, "object":Lorg/telegram/tgnet/TLRPC$BotInlineResult;
    if-nez v3, :cond_5

    .line 16335
    .end local v0    # "a":I
    .end local v1    # "count":I
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$BotInlineResult;
    :cond_4
    :goto_2
    return-void

    .line 16332
    .restart local v0    # "a":I
    .restart local v1    # "count":I
    .restart local v3    # "object":Lorg/telegram/tgnet/TLRPC$BotInlineResult;
    :cond_5
    iget-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->results:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16327
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 16334
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$BotInlineResult;
    :cond_6
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    iput v4, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->cache_time:I

    goto :goto_2
.end method

.method public serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V
    .locals 4
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;

    .prologue
    .line 16338
    sget v2, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->constructor:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 16339
    iget-boolean v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->gallery:Z

    if-eqz v2, :cond_2

    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    or-int/lit8 v2, v2, 0x1

    :goto_0
    iput v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    .line 16340
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 16341
    iget-wide v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->query_id:J

    invoke-virtual {p1, v2, v3}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt64(J)V

    .line 16342
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_0

    .line 16343
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->next_offset:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeString(Ljava/lang/String;)V

    .line 16345
    :cond_0
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_1

    .line 16346
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->switch_pm:Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$TL_inlineBotSwitchPM;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 16348
    :cond_1
    const v2, 0x1cb5c415

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 16349
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->results:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 16350
    .local v1, "count":I
    invoke-virtual {p1, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 16351
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 16352
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->results:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$BotInlineResult;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$BotInlineResult;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 16351
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 16339
    .end local v0    # "a":I
    .end local v1    # "count":I
    :cond_2
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->flags:I

    and-int/lit8 v2, v2, -0x2

    goto :goto_0

    .line 16354
    .restart local v0    # "a":I
    .restart local v1    # "count":I
    :cond_3
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_messages_botResults;->cache_time:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 16355
    return-void
.end method
