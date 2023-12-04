package objects;

import lombok.*;

import java.util.UUID;
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class AccountCookieObjects {
    private UUID accountId;
    private String role;

}
